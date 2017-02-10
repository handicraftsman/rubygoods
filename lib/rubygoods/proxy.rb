module RG
  class Proxy
    attr_reader :objs

    def initialize(mode, objs)
      case mode
      when :single
        p_init_single(objs)
      when :multiple
        p_init_multiple(objs)
      else
        fail ArgumentError, "Invalid mode"
      end
    end

    def p_init_single(obj)
      @objs = [obj]
    end

    def p_init_multiple(objs)
      init_single(objs) if objs.class != Array
      @objs = objs
      cl = @objs[0].class
      @objs.each do |o|
        fail(ArgumentError, "Objects' Classes are not same!") if (o.class != cl)
      end
    end

    def method_missing(m, *args, &block)  
      results = []
      @objs.each do |o|
        results << o.send(m, *args, &block)
      end
      results
    end

    def p_eval(dat)
      results = []
      @objs.each do |o|
        results << o.instance_eval(dat)
      end
      results
    end

    def p_inspect()
      results = []
      @objs.each do |o|
        results << o.inspect
      end
      results
    end
  end
end