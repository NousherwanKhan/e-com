module ImageResize

    extend ActiveSupport::Concern

    included do

        def image_as_thumbnails
            image.variant(resize_to_limit: [100, 50]).processed
        end

        def image_as_card
            image.variant(resize_to_limit: [300, 300]).processed
        end
    end

end