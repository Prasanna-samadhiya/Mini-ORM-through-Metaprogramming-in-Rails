# MiniRecord

**MiniRecord** is a lightweight, Ruby-based ORM (Object Relational Mapping) built using metaprogramming techniques. It is intended for learning and experimentation purposes and can be used interactively via the Rails console. This ORM does not interact with a real database but simulates model behavior entirely in memory.

## Features

- Dynamic field definition
- Attribute getters and setters
- Object creation and storage
- Record querying and filtering
- Record updating and deletion
- Dynamic finder methods (`find_by_<field>`)
- Written using core Ruby metaprogramming techniques

## Getting Started

To use `MiniRecord`, save the class in a file under `app/lib/mini_record.rb` and load it through the Rails console:

```ruby
require Rails.root.join('app/lib/mini_record.rb')
