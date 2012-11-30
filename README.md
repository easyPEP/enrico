enrico
===========

enrico is a small wrapper around the JSON API from [enrico](http://kayaposoft.com/enrico/json/)

The Enrico Service
------------------

```
Enrico Service is a free service written in PHP providing public holidays for several 
countries. You can use either web service or json to get public holidays from Enrico. 
Each provided public holiday includes date and name of the holiday in the local language 
and English. Public holidays for the countries like U.S. or Germany are provided separately for each state. 
You can use Enrico Service to display public holidays on your website or in your desktop application written in any programming language. 
lthough Enrico is free to use, we do not provide the source code for download. If you are interested in hosting Enrico on your 
server, please contact us on enrico@kayaposoft.com.
```

Getting Started
---------------

To get all supported countries:

```ruby
require "rubygems"
require "enrico"

Enrico::Country.all
```

If you want to get in more details for a country, initial Enrico with the ’country_code’

<<<<<<< HEAD
    country = Enrico::Country.new("ger")
    country.details
    country.regions

Enrico implements only a couple of methods, which are pretty much self explenatory:

  ```
  country.public_holidays_for_month(Date.today)
  ```

  ```
  country.public_holidays_for_year(Date.today)
  ```

  ```
  country.public_holidays_for_date_range(Date.today, Date.today + 2.month)
  ```

  ```
  country.is_public_holiday?(date)
  ```
=======
```ruby
country = Enrico::Country.new("ger")
country.details
country.regions
```

Enrico implements only a couple of methods, which are pretty much self explenatory:

```
country.public_holidays_for_month(Date.today)
```

```
country.public_holidays_for_year(Date.today)
```

```
country.public_holidays_for_date_range(Date.today, Date.today + 2.month)
```

```
country.is_public_holiday?(date)
```
>>>>>>> a4214e5fbbb2b9df5a0110e2a93e0b1913fec159

Installation
------------

    gem install enrico

or in your Gemfile:

    gem 'enrico'


Documentation
-------------

### More Resources

+ [Enrico](http://kayaposoft.com/enrico/)
+ [Enrico JSON API](http://kayaposoft.com/enrico/json/)


License
-------

Copyright (c) 2012 easyPEP UG

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to use, copy and modify copies of the Software, subject 
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
