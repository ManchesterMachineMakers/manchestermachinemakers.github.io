require_relative "glitchworks_block"

module MMMSite
    class Sponsor < GlitchWorks::Tag
        def bind_params(params)
            @name = params[:name]
            @img = params[:img]
            @url = params[:url]
        end
        def internal_render
            <<~SPONSOR
            <a href="#@url"><img src="#@img" alt="#@name" title="#@name" width=300 /></a>
            SPONSOR
        end
    end
end
Liquid::Template.register_tag 'sponsor', MMMSite::Sponsor