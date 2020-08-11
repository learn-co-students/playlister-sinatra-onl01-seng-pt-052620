module Slugger
    module InstanceMethods
        def slug
            self.name.downcase.split(' ').join('-')
        end
    end
    module ClassMethods
        def find_by_slug(slug)
            self.all.detect { |d| d.slug == slug }
        end
    end
end
