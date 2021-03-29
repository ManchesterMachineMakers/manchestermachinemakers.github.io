require_relative "glitchworks_block"

module MMMSite
    class Sponsors < GlitchWorks::Block
        def bind_params(params)
        end
        def internal_render
            <<~PROFILE
            <div class="sponsors">
            #@text
            </div>
            PROFILE
        end
    end
end
Liquid::Template.register_tag 'sponsors', MMMSite::Sponsors