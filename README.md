# README

# DirectShifts ROR Assessment

# Developer Note to Reviewer
Given the ETA(2 days) for this assessment,
I have implemented all features using Rails(API and UI) for now as I have not worked with React.
# Problem Statement

1. Create a Rails(3.0.1) + React project(7.0.1)

2. Features:
- Users should be able to Sign-Up/Login both via UI and via API call.
- Users should be able to send referral link to any email address.
- The referral email should contain a link that redirects to sign up page.
- User’s home page should show all the email addresses that were referred.

3. Authentication:
- Use Devise to authenticate. The signup/login should happen using Material UI.
- Make Devise work with APIs such that we can signup/login using APIs as well.

4. Specifications:
- Use MySQL for database
- Integrate Material UI for React UI

5. Setup the following scripts inside the ‘bin’ folder of the Rails project
- bin/setup script to setup the project on local
- bin/dev script to run the server (should run both rails and react server)

# Implemented Features

1. Created application with Rails 7 with MySql & Devise Authentication.
2. Users are able to login/sign up via UI(using ERB views).
3. Users can login from this url- http://localhost:3000/users/sign_in
4. Users can sign Up from this url- http://localhost:3000/users/sign_up or by clicking sign up link from home page.
<img width="565" alt="sign_up" src="https://user-images.githubusercontent.com/5313625/226101775-d0108498-44bb-4b17-8e0c-686f95ead4b0.png">

5. A "referral_code" is generated for each user who signs up to the app. This code will be sent to the referred users via the sign up link.
6. After logging in Users are directed to Home Page where they can see the list of users that the user had referred.
7. A logged in user is redirected to referrals page by clicking- "Click on send new referral email" link on home page.
8. On Referrals page, the user can enter any email and send link.
<img width="400" alt="send_referral" src="https://user-images.githubusercontent.com/5313625/226101793-738a783a-34b5-471b-8790-93cf15ca9474.png">

9. On successful email processing users will receive the link with the "referral_code" of the referee. For eg.- http://localhost:3000/users/sign_up?referral_code=1a5jNykLhf
10. If a user signs up using this link, the "referred_by" column gets updated with the user who sent the email.(We can also verify this by using the same url and signing up manually. Once signed up the user is updated as the "referred user" and will be listed at the home page of the referee user).
<img width="541" alt="list_referred_users" src="https://user-images.githubusercontent.com/5313625/226101781-03f71a17-f07e-44e0-bd25-c20456ffc594.png">

# APIs
User can Signup & Sign in via API using POST request.
APIs end points are defined at "api/v1/sign_up" & "api/v1/sign_in"

Request format:

```json
{
 "user": {
  "email":"test@test.com",
  "password":"test123",
  "password_confirmation": "test123"
 }
}
```
A sample response from Postman:
<img width="1373" alt="postman- sign-up" src="https://user-images.githubusercontent.com/5313625/226101800-d4b58bb6-790f-4dc7-8a33-1dd3c677ad02.png">


# Installation

1. Clone repo to local
```
https://github.com/mohinid/referral-app.git
```

2. Install [rvm](https://rvm.io/)

3. Install ruby 3.0.1
```
rvm install $(cat .ruby-version)
```
4. Install [MySql](https://dev.mysql.com/doc/refman/8.0/en/installing.html)

5. Setup App
Go to the referral-app directory. Run setup
```
bin/setup
```
6. Start server
```
rails s
```
7. Navigate to [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in)

# Pending Features due to time constraints.
1. Can add Specs - Unit tests as well as Integration.
2. Sign up via actual Email link was not verified. Only verified via manually using the link.
3. Currently user can see the list of all emails which signed-up using their referral-code. They don't see the pending invitations.
4. Can add more Validations/Conditions.
5. Integration with React.

# Contributors
None. I did it myself! 😄
