# Taken from Rails 2.1
class Module
  def mod_attr_reader(*syms)
    syms.each do |sym|
      next if sym.is_a?(Hash)
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        
        def self.#{sym}
          @@#{sym}
        end

        def #{sym}
          @@#{sym}
        end
      EOS
    end
  end

  def mod_attr_writer(*syms)
    options = syms
    syms.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        
        def self.#{sym}=(obj)
          @@#{sym} = obj
        end
        
        #{"
        def #{sym}=(obj)
          @@#{sym} = obj
        end
        "  }
      EOS
    end
  end

  def mod_attr_accessor(*syms)
    mod_attr_reader(*syms)
    mod_attr_writer(*syms)
  end
end