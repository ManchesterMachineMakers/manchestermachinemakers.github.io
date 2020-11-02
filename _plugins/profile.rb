require_relative "glitchworks_block"
require 'kramdown'
require 'kramdown-parser-gfm'

module MMMSite
    class Profile < GlitchWorks::Block
        def bind_params(params)
            @name = params[:name] or raise SyntaxError, 'Must have name for profile'
            @image = params[:img]
            @hsize = params[:hsize]
            @image = 'http://placekitten.com/g/600/400' if @image == '' or @image.nil?
            @hsize = 2 if @hsize == '' or @hsize.nil?
        end
        def internal_render
            <<~PROFILE
            <h#{@hsize}>#{@name}</h#{@hsize}>
            <img src="#{@image}" alt="#{@name} (Image)"/>
            <p>
            #{Kramdown::Document.new(@text, input: 'GFM').to_html}
            </p>
            PROFILE
        end
    end
end
Liquid::Template.register_tag 'profile', MMMSite::Profile