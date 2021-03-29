require_relative "glitchworks_block"
require 'kramdown'
require 'kramdown-parser-gfm'
require 'yaml'

module MMMSite
    class Profile < GlitchWorks::Block
        def bind_params(params)
            @name = params[:name] or raise SyntaxError, 'Must have name for profile'
            @title = params[:title]
            @image = params[:img]
            @hsize = params[:hsize]
            @image = 'https://placeimg.com/740/380/animals/grayscale' if @image == '' or @image.nil?
            @hsize = 2 if @hsize == '' or @hsize.nil?
        end
        def internal_render
            frontmatter = eval(YAML.load(@text).inspect)
            @text.gsub!(/---(.|\n)*---/, '') # Remove frontmatter from markdown
            <<~PROFILE
            <figure class="profile" id="profile-#{@name.gsub(/\s/, '-')}">
                <div class="image-container">
                    <img src="#{@image}" alt="#{@name}" height="200"/>
                </div>
                <figcaption>
                    <div class="profile-header">
                        <h#{@hsize} class="profile-name">#{@name}</h#{@hsize}>
                        <strong class="profile-title">#{@title}</strong>
                    </div>
                    <div class="profile-text">
                        #{(frontmatter.map {|key, value| "<b>#{key}:</b> #{value}"}).join "<br/>"}
                        #{Kramdown::Document.new(@text, input: 'GFM').to_html}
                    </div>
                </figcaption>
            </figure>
            PROFILE
        end
    end
end
Liquid::Template.register_tag 'profile', MMMSite::Profile