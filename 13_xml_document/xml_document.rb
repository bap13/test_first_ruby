class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indents = 0
  end

  def method_missing(tag_name, args = {}, &block)
    tag = { :opening => "<#{[tag_name, attributes(args)].join(" ").strip}>",
            :closing => "</#{tag_name}>" }

    if block_given?
      string = ""
      string << ("  " * @indents) if @indent
      string << tag[:opening]
      string << "\n" if @indent
      @indents += 1
      string << yield
      @indents -= 1
      string << ("  " * @indents) if @indent
      string << tag[:closing] 
      string << "\n" if @indent 
      return string
    else
      string = ""
      string << ("  " * @indents) if @indent
      string << "#{tag[:opening].chop}/>" 
      string << "\n" if @indent    
      return string
    end
  end

  def attributes(args)
    attributes = []
    args.keys.sort.each do |attr|
      attributes.push(format("%s='%s'",attr, args[attr]))
    end
    return attributes
  end
end
