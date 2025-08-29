class MiniRecord
    
    def self.fields(*names)
      @fields ||= []
      @fields.concat(names)
  
      names.each do |name|
        define_method(name) do
          instance_variable_get("@#{name}")
        end
  
        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
        end
      end
  
      @fields
    end
  
    def self.all_fields
      @fields || []
    end
  
    def self.records
      @records ||= []
    end
  
    def self.create(attrs = {})
      obj = new(attrs)
      records << obj
      obj
    end
  
    def self.all
      records
    end
  
    def self.find_by(attr_name, value)
      records.find { |record| record.send(attr_name) == value }
    end

    def update(attrs = {})
      attrs.each do |key, value|
        if self.class.all_fields.include?(key.to_sym)
        send("#{key}=", value)
        end
      end
      self
    end

    def destroy
        self.class.records.delete(self)
    end


  
    def initialize(attrs = {})
      symbolized = attrs.transform_keys(&:to_sym)
      self.class.all_fields.each do |field|
        instance_variable_set("@#{field}", symbolized[field])
      end
    end

    def self.method_missing(method_name, *args)
        method_str = method_name.to_s
    
        if method_str.start_with?("find_by_")
          field = method_str.sub("find_by_", "").to_sym
          if all_fields.include?(field)
            return find_by(field, args.first)
          end
        end
    
        puts "Method '#{method_name}' not found!"
        nil
    end
  end