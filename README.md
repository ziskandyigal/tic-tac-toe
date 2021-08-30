# README
DISCLAIMER - it's a pet project in order to get into rails ecosystem.

BE - rails as an api
FE - Svelte SPA


## Apply Svelte into Rails
### add svelte to rails
`rails webpacker:install:svelte`
### add js script to `application.html.erb` file
`<%= javascript_pack_tag 'hello_svelte' %>`
### add controller and map it to the domain root route
`rails g controller home index`
`root 'home#index'` _add to `routes.rb` file_

## routes _basic crud_
`/users`

`/tokens`

`/games`

`/comments`


## notes 
- disable crsf checks (for local development)
add `protect_from_forgery with: :null_session, only: [:create]` to `aaplication_controller.rb`


## TODO
- add additional notes
