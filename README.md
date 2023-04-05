# README

# DirectShifts ROR Assessment

# Message to Reviewer
Due to time constraint, I have implemented all requested features using Rails(with basic SCSS styling for UI), as I have not worked with React.

# Problem Statement

1. Create a Rails(3.0.1) + React project(7.0.1)

2. Features:
- Users should be able to Sign-Up/Login both via UI and via API call.
- Users should be able to send Referral Link to any email address.
- The referral email should contain a link that redirects to sign up page.
- User’s home page should show all the email addresses that were referred.

3. Authentication:
- Use Devise to authenticate. The Sign-Up/Login should happen using Material UI.
- Make Devise work with APIs such that we can Sign-Up/Login using APIs as well.

4. Specifications:
- Use MySQL for database
- Integrate Material UI for React UI

5. Setup the following scripts inside the ‘bin’ folder of the Rails project
- bin/setup script to setup the project on local
- bin/dev script to run the server (should run both rails and react server)

# Implemented Features

1. Created application with Rails 7 with MySql & Devise Authentication.

2. Users are able to Login/Sign Up via UI(using ERB views).

3. Users can Login from UI using this url- http://localhost:3000/users/sign_in
<img width="349" alt="Screenshot 2023-04-05 at 1 18 32 AM" src="https://user-images.githubusercontent.com/5313625/229904819-9b533b16-3bd8-413c-bc5f-e4f216c1b093.png">

4. Users can Sign Up from this url- http://localhost:3000/users/sign_up or by clicking sign up link from home page.

5. A *"referral_code"* is generated for each user who signs up to the app. This code will be sent to the referred users inside the Sign Up link.

6. After logging in Users are directed to Home Page where they can see: 'The list of Emails that user have referred as'- **Emails with pending invite** & 'The list of users who have Signed-Up to the app via his Referral Code' as- **Users who subscribed via your invite** 
<img width="1792" alt="Screenshot 2023-04-05 at 1 19 02 AM" src="https://user-images.githubusercontent.com/5313625/229904491-a02efce8-20f5-4e9d-9c25-5e67e0802f83.png">

7. A logged in user is redirected to referrals page by clicking- *"Click on send new referral email"* link on home page.

8. On Referrals page, the user can enter any email to a user. Email field cant be blank.
<img width="695" alt="Screenshot 2023-04-04 at 9 54 40 PM" src="https://user-images.githubusercontent.com/5313625/229866633-0d7597a5-0f26-4079-a2ad-cf13ab66edc9.png">

9. If the email already exists as a subscriber or in the referred users table, user will be shown an error message- *"Email ... already exists as a referred user or subscriber. Please use another email."* as shown below.
<img width="812" alt="Screenshot 2023-04-05 at 1 19 38 AM" src="https://user-images.githubusercontent.com/5313625/229905718-a14a6588-0374-4ff4-9278-5f9b679d43f8.png">

10. On successful email processing users will receive the link with the *referral_code* of the referee. For eg.- http://localhost:3000/users/sign_up?referral_code=1a5jNykLhf. Also, User will shown a message - *"Email to ... sent and saved for reference!"* as shown below.
<img width="1156" alt="Screenshot 2023-04-05 at 1 20 10 AM" src="https://user-images.githubusercontent.com/5313625/229905763-a6c8fd95-e93a-4ce3-969c-2e4b483399c3.png">

11. User can check the Email Preview on link - "http://localhost:3000/rails/mailers/referral_mailer/send_referral_email" since actual email service is not setup.

<img width="1006" alt="Screenshot 2023-04-04 at 10 17 51 PM" src="https://user-images.githubusercontent.com/5313625/229866363-98a0ce6e-ba71-46d5-841c-a09a6254c230.png">

12. We can also verify the referral feature by using the same link as shown in email preview by signing up manually. On successful sign up by the referred email, the referee user's home page list will be updated with his detail.

13. Added simple SCSS styling.

# APIs
User can Sign Up & Sign In via API using POST requests.
APIs end points are defined at "api/v1/sign_up" & "api/v1/sign_in"

**Request format for Sign Up:**

Note: "referred_by_id" is optional.

```json
{
 "user": {
  "email":"test@test.com",
  "password":"test123",
  "password_confirmation": "test123",
  "referred_by_id": "1"
 }
}
```
A sample response from Postman:
<img width="1231" alt="Screenshot 2023-04-04 at 10 04 48 PM" src="https://user-images.githubusercontent.com/5313625/229866470-b61d14be-1b02-4c7d-bc79-91312627a0d7.png">


For Login, User can use the **"authentication_token"** received in response on Sign-Up. Request headers should contain:
**'X-Auth-Email'** & **'X-Auth-Token'**

A sample response from Postman:
<img width="1244" alt="Screenshot 2023-04-04 at 10 06 46 PM" src="https://user-images.githubusercontent.com/5313625/229866429-d69dffb7-487a-45d4-9e8f-2ccdaff21a5f.png">

# Tests

RSpecs are implemented for all APIs, Controllers, Models & Mailer.
You can run and check using command: ```bundle exec rspec```
<img width="724" alt="Screenshot 2023-04-05 at 1 30 51 AM" src="https://user-images.githubusercontent.com/5313625/229907022-e955f381-b055-46fe-8823-66d6805ae446.png">

# Seed Data

User1: 'test1@example.com' password: 'test123'

User2: 'test2@example.com' password: 'test123', referred_by: User1

Referred Email by User1: test@referral.com

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
<img width="875" alt="Screenshot 2023-04-05 at 1 29 26 AM" src="https://user-images.githubusercontent.com/5313625/229907137-7f2e3503-e0e9-46f1-b4fc-544b2ac5f78d.png">

6. Start server
```
rails s
```
7. Navigate to [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in)

8. To Login, use existing email as shared in previous section of Seed Data or Sign up with your own user!

# Contributors
None. I did it myself! 😄 
Thanks for reading up.
