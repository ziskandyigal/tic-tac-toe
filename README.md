# README

### add svelte to rails
`rails webpacker:install:svelte`
### add js script to `application.html.erb` file
`<%= javascript_pack_tag 'hello_svelte' %>`
### add controller and map it to the domain root route
`rails g controller home index`
`root 'home#index'` _add to `routes.rb` file_

## routes
`/users`
- create
- delete

`/tokens`
- create


## notes 
- disable crsf checks
add `protect_from_forgery with: :null_session, only: [:create]` to `aaplication_controller.rb`
