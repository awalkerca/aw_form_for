# AW Form For

Create dry forms by reducing the boilerplate form field elements.


## Installation

add to your Gemfile and run the 'bundle' command to install it.

```ruby
gem aw_form_for
```

**Requires Ruby 1.9.2 or later.**

## Usage

call `aw_form_for` in an ActionView class and pass in the model to be rendered and a block containing the form content.

The standard form fields are available, as well as:

```
collection_check_box(attribute, records, record_id, record_name, *args)
error_messages(error_message, *args)
```

