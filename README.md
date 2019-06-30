[http://www.passivehousedetails.org](http://www.passivehousedetails.org)

[https://passivehousedetails.herokuapp.com](https://passivehousedetails.herokuapp.com)


You will need:

Ruby 2.3 and Rails 5

To make sure the right gem versions(in Gemfile) are installed:

    $ bundle install

 or 

    $ bundle update

(p.s. This may take some time)    

To migrate the database:

    $ rails db:migrate

To start the server:

    $ rails server

The app will be available at: http://localhost:3000     

If your system complains about the lack of a JavaScript runtime, visit the [execjs page at GitHub](https://github.com/sstephenson/execjs) for a list of possibilities. It is recommended to install [Node.js](https://nodejs.org/en/).


To deploy to Heroku:

    $ heroku create (name optional)
    $ git push heroku
    $ heroku run rails db:migrate

To handle the pictures used [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) image uploader.
To configure our application to use cloud storage for the images in production, used fog gem in:
`app/uploaders/picture_uploader.rb`

To store the images used Amazon.com’s [Simple Storage Service - S3 ](https://aws.amazon.com/s3/).
Here are the steps to getting set up:

Sign up for an Amazon Web Services account.
Create a user via [AWS Identity and Access Management - IAM](https://aws.amazon.com/iam/) and record the access key and secret key.

Create an S3 bucket (with a name of your choice) using the [AWS Console](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fs3%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fs3&forceMobileApp=0), and then grant read and write permission to the user created in the previous step.

Once you’ve created and configured your S3 account, you should create and fill the CarrierWave configuration file in:
`config/initializers/carrier_wave.rb`

To avoid hardcoding sensitive information the ENV variables can be set on Heroku's UI goint to the app's Setting and hitting Reveal Config Vars button  or set them on the CLI running:

    $ heroku config:set S3_ACCESS_KEY=<access key>
    $ heroku config:set S3_SECRET_KEY=<secret key>
    $ heroku config:set S3_BUCKET=<bucket name>

For the email account activation used SendGrid(400 emails a day with the 'starter' free tier). Can be added to the app with:

    $ heroku addons:create sendgrid:starter  

or

    $ heroku addons:add sendgrid:starter  



To configure the application to use SendGrid, you need to fill out the SMTP settings for our production environment. You will also have to define a host variable with the address of your production website in:

`config/environments/production.rb`  

In this case, the variables are configured automatically via the SendGrid add-on, but can be modified the same way as the S3 variables.
To view the ENV vars run:

    $ heroku config:get SENDGRID_USERNAME
    $ heroku config:get SENDGRID_PASSWORD


