#######################################
#                                     #
#       RubyGems Alfred Workflow      #
#       version 0.2.0                 #
#       BlueVajra.com                 #
#                                     #
#######################################

require 'open-uri'
require 'json'

class Item
  def initialize(title, arg)
    @title = "gem '#{title}', '~> #{arg}'"
    @arg = "gem '#{title}', '~> #{arg}'"
  end

  def to_xml
    %{<item arg="#{@arg}" valid=\"yes\"><title>#{@title}</title></item>}
  end
end

class GemList
  def initialize(filter)
    @filter = filter
  end

  def gem_versions
    @error = nil
    begin
      gem_api = "https://rubygems.org/api/v1/versions/#{@filter}.json"
      @json = (open(gem_api).read)
    rescue OpenURI::HTTPError => ex
      @error = "Page Not Found"
    end

    [@error, @json]
  end

end

class RubyGemVersions
  def initialize(filter)
    @filter = filter
  end

  def all
    result = GemList.new(@filter).gem_versions

    if result[0]
      not_found(result[0])
    else
      parse_results(result[1])
    end
  end

  def not_found(error)
    xml = "<?xml version=\"1.0\"?><items><item valid=\"no\"><title>#{error}</title></item></items>"

    puts xml
  end

  def parse_results(json)
    results = JSON.parse(json)

    version_array = []

    results.each do |result|
      if result['prerelease'] == false
        version_array << result['number']
      end
    end

    create_xml(version_array)

  end

  def create_xml(version_array)

    items_as_xml = ""
    version_array.take(8).each do |version|
      items_as_xml += Item.new(@filter, version).to_xml
    end

    xml = "<?xml version=\"1.0\"?><items>#{items_as_xml}</items>"

    puts xml
  end

end

filter = '{query}'

RubyGemVersions.new(filter).all