require_relative "glitchworks_block"
require 'kramdown'
require 'kramdown-parser-gfm'

module MMMSite
    class Profile < GlitchWorks::Block
        def bind_params(params)
            @name = params[:name] or raise SyntaxError, 'Must have name for profile'
            @title = params[:title]
            @image = params[:img]
            @hsize = params[:hsize]
            @image = 'http://placekitten.com/g/740/380' if @image == '' or @image.nil?
            @hsize = 2 if @hsize == '' or @hsize.nil?
        end
        def internal_render
            <<~PROFILE
            <section class="profile">
            <img class="profile-image" src="#{@image}" alt="#{@name} (Image)"/>
            <div class="profile-header">
                <h#{@hsize} class="profile-name">#{@name}</h#{@hsize}>
                <strong class="profile-title">#{@title}</strong>
            </div>
            <div class="profile-text">
            #{Kramdown::Document.new(@text, input: 'GFM').to_html}
            </div>
            </section>
            PROFILE
        end
    end
end
Liquid::Template.register_tag 'profile', MMMSite::Profile