Ruby Gem Workflow for Alfred 2
==============================

Alfred Workflow for working with Rubygems.org
* version 0.2.0

## Usage
* `gem s sinatra` => searches 'sinatra' on rubygems.org
* `gem g sinatra` => goes to the sinatra page on rubygems.org
* `gem c sinatra` => returns list of gemfile versions. 
  * `Press Enter` => copies most recent gemfile* spec to the clipboard
  * `Press Cmd + Enter` => pastes most recent gemfile* spec to the top app
* i.e. gem 'sinatra', '~> 1.4.4'

*non-prerelease 

## Download

* [https://github.com/BlueVajra/ruby_gem_workflow/raw/master/RubyGems.alfredworkflow](https://github.com/BlueVajra/ruby_gem_workflow/raw/master/RubyGems.alfredworkflow)

## Find Me

* [http://www.bluevajra.com](http://www.bluevajra.com)
* [https://github.com/BlueVajra/ruby_gem_workflow](https://github.com/BlueVajra/ruby_gem_workflow)

## Details

This is my first workflow, so if you have any problems, please let me know. I will be improving and expanding this hopefully in the future to have similar functionality as kenshin's. This was inspired by kenshin's ruby gems... and not as pretty. https://github.com/kenshin54/alfred2-rubygems-workflow

## Development Ideas

* ~~get "feedback" from the rubygems api for alfred to parse during searches~~
* ~~specify a particular release for searching or copying~~
* ~~enable pasting option to automatically paste the copy~~

## Revision History

* '0.2.0' 9-25-2014 - 'gem c' now returns list of gemfile version for user to select
* `0.1.1` 3-26-2014 - `gem c` now returns most recent non-pre-release declaration
* `0.1.0` 3-26-2014 - First go at this