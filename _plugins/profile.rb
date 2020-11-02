require_relative "glitchworks_block"
require 'kramdown'

module MMMSite
    class Profile < GlitchWorks::Block
        def bind_params(params)
            @name = params[:name] or raise SyntaxError, 'Must have name for profile'
            @image = params[:img]
            @image = 'http://placekitten.com/g/600/400' if @image == '' or @image.nil?
        end
        def internal_render
            <<~PROFILE
            <h1>#{@name}</h1>
            <img width="600" height="400" src="#{@image}" alt="#{@name} (Image)"/>
            <p>
            #{Kramdown::Document.new(@text).to_html}
            </p>
            PROFILE
        end
    end
end
Liquid::Template.register_tag 'profile', MMMSite::Profile