module Editorial
  module Page1
    def aa_contents
      'page1'
    end
  end

  module Page2
    def aa_contents
      'page2'
    end

    def aa_draft_version
    end
  end

  module Page3
    def self.included(base)
      base.class.class_eval do
        include ClassMethods
      end
    end

    module ClassMethods
      def aa_contents
        'page3'
      end
    end

  end
end

class Bbcom 
  extend Editorial::Page1
  extend Editorial::Page2
end

class Bgov
  include Editorial::Page3
end

class Bw
  self.class.class_eval do
    include Editorial::Page1
  end
end

