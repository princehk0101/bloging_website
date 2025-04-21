from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
from waitress import serve
import pymysql
pymysql.install_as_MySQLdb()
# Removed invalid import as it is not required


from flask_mail import Mail
import json
import os
import math

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'the random string' # Replace with a strong secret key
app.config['UPLOAD_FOLDER'] = params['upload_location']

# Mail Configuration
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT=587,
    MAIL_USE_TLS=True,
    MAIL_USE_SSL=False,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)

mail = Mail(app)

# Database Configuration
local_server = True
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Ensure Tables Exist
with app.app_context():
    db.create_all()

# Database Models
class User(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    phone = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    message = db.Column(db.String(500), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False, unique=True)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    image_file = db.Column(db.String(12), nullable=True)

# Routes
@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    
    page = request.args.get('page')
    if page is None or not str(page).isnumeric():
        page = 1
    else:
        page = int(page)
    
    posts = posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts']) + int(params['no_of_posts'])]
    
    if page == 1:
        prev = "#"
        next= "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html.j2', params=params, posts=posts, datetime=datetime, prev=prev, next=next, page=page)




@app.route('/about')
def about():
    return render_template('about.html.j2', params=params, datetime=datetime)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():

    if ( 'user' in session and session['user'] == params['admin_user']):
         posts = Posts.query.all()
         return render_template('dashboard.html.j2', params=params, posts=posts, datetime=datetime)
         
      
    
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if(username == params['admin_user'] and password == params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html.j2', params=params, posts=posts, datetime=datetime)
            # return render_template('dashboard.html', params=params, datetime=datetime)
          
        
    return render_template('login.html', params=params, datetime=datetime)

    

@app.route("/edit/<int:sno>", methods=['GET', 'POST']) 

def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
      if request.method == 'POST':  

        title = request.form.get('title')
        slug = request.form.get('slug')
        content = request.form.get('content')
        tagline = request.form.get('tagline')
        image_file = request.form.get('image_file')
        date = datetime.now()

        if sno == 0:
            post = Posts(title=title, slug=slug, content=content, tagline=tagline, image_file=image_file, date=date)
            db.session.add(post)
            db.session.commit()
        else:
            post = Posts.query.filter_by(sno=sno).first()
            post.title = title
            post.slug = slug
            post.content = content
            post.tagline = tagline
            post.image_file = image_file
            post.date = date
            db.session.commit()

        return redirect('/edit/' + str(post.sno))
      post = Posts.query.filter_by(sno=sno).first()
      return render_template('edit.html.j2', params=params,  datetime=datetime, post=post)
    
    # return redirect('/dashboard')

@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
         if request.method == 'POST':
           f = request.files['file1']
           f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
           return "File saved successfully"
    return render_template('uploader.html', params=params, datetime=datetime)
    
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<int:sno>", methods=['GET', 'POST']) 
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        if post:
            db.session.delete(post)
            db.session.commit()
    return redirect('/dashboard')



@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    if not post:
        return "<h1>404 Not Found</h1><p>Post not found in database.</p>"
    return render_template('post.html.j2', params=params, post=post , datetime=datetime)





# Contact Form Route
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        message = request.form['message']

        # Save to database
        entry = User(name=name, email=email, phone=phone, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()

        # Send Mail
        mail.send_message(
            'New message from blog: ' + name,
            sender=email,
            recipients=[params['gmail-user']],
            body=message + "\nContact: " + phone
        )

        return "Message sent successfully!"

    return render_template('contact.html.j2', params=params , datetime=datetime)



if __name__ == '__main__':
    serve(app, host='127.0.0.1', port=5000)


    

    

