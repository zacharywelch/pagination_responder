# PaginationResponder

A Rails responder for pagination

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pagination_responder', git: 'git@cagit.careerbuilder.com:zwelch/pagination_responder.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'pagination_responder', git: 'git@cagit.careerbuilder.com:zwelch/pagination_responder.git'

`PaginationResponder` includes [Kaminari](https://github.com/amatsuda/kaminari) as a dependency. 

## Usage

Add `Responders::PaginationResponder` to your responder chain:

```ruby
class ApplicationResponder < ActionController::Responder
  include Responders::PaginationResponder
end

class MyController < ApplicationController
  self.responder = ApplicationResponder
end
```

`PaginationResponder` adds pagination headers to your response when the resource is paginated.

```ruby
User.page(2)

HTTP Headers
------------
Pagination-Count: 100
Pagination-Limit: 25
Pagination-Offset: 25
Pagination-Next: http://localhost:3000/users?page=3
Pagination-Prev: http://localhost:3000/users?page=1
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your feature.
4. Add your feature.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
