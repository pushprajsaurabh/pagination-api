# pagination-api

Rails project which implements pagination API to fetch 50 states of U.S.A.

## dependencies
> Rails (4.2.2)
> Ruby (2.2.0)

## Steps to run the project locally:

**1. Install Ruby using RVM**

$$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$$ curl -sSL https://get.rvm.io | bash -s stable
$$ source ~/.rvm/scripts/rvm
$$ rvm use --install 2.2.0
$$ rvm use 2.2.0

**2. Install Rails:**

$$ gem install rails -v 4.2.2

**3. Go to the project directory and run the following command:**

$$ bundle install

**4. To start the server:**

$$ rails s


## Accessing the pagination api:

http://localhost:3000/api/v1/states?per_page=0&page=0

## Params:

per_page - Number of entries per page
page - Page nunmber for which the data is to be fetched.