# Mirrorable
module Mirrorable
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_mirrorable(field, &block)
      class_eval <<-END
        def #{field.to_s}
          read_attribute(:#{field}) ||
          #{field}_mirror
        end
        
        def real_#{field.to_s}
          read_attribute(:#{field})
        end
        
        def #{field.to_s}=(value)
          value = nil if value.respond_to?(:empty?) && value.empty?
          write_attribute('#{field}', value)
          
          puts "SEVERITY"
          puts real_#{field.to_s}
        end
      END
      
      class_eval do
        define_method "#{field}_mirror", &block
      end
    end
    
    def acts_as_modifiable(field, &block)
      class_eval <<-END
        def update_#{field.to_s}_unless_modified
          write_attribute(:#{field}, #{field}_default) unless read_attribute(#{field}_modified)
        end

        def #{field.to_s}=(value)
          if value.nil? ||
             (value.respond_to?(:empty?) && value.empty?)
            write_attribute(:#{field}_modified, false)
            update_#{field}
          else
            write_attribute(:#{field}_modified, true)
            write_attribute(:#{field}, value)
          end
        end
      END
      
      class_eval do
        define_method "#{field.to_s}_default", &block
      end
    end
  end
end

ActiveRecord::Base.class_eval do
  include Mirrorable
end
