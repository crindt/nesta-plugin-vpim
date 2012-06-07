module Nesta
  module Plugin
    module Vpim
      module Helpers
        # If your plugin needs any helper methods, add them here...
      end
    end
  end

  class App
    require 'vcard'

    helpers Nesta::Plugin::Vpim::Helpers do

      def strip_or_str(str)
        if str == nil
          return ""
        else
          return str.strip! || str
        end
      end

      def process_vcard(file)
        if File.exist?( file )
          vc = File.new(file)
          vcard = Vpim::Vcard.decode(vc).first
          haml :vcard_schema, :layout => false, :locals => { :card => vcard, :img => @page.metadata('photo') }
        end
      end

      def process_org_vcard(file)
        if File.exist?( file )
          vc = File.new(file)
          vcard = Vpim::Vcard.decode(vc).first
          haml :vcardorg, :layout => false, :locals => { :card => vcard }
        end
      end

      def condensed_contact(file)
        if File.exist?( file )
          vc = File.new(file)
          vcard = Vpim::Vcard.decode(vc).first
          haml :vcardorgcondensed_schema, :layout => false, :locals => { :card => vcard }
        else
          $stderr.puts("vCard file '#{file}' does not exist for")
        end
      end

      def social_bookmarks_from_vcard(file, publisher = false)
        if File.exist?( file )
          vc = File.new(file)
          $stderr.puts("#{file}: #{vc}")
          vcard = Vpim::Vcard.decode(vc).first
          $stderr.puts(vc)
          haml :social, :layout => false, :locals => { :card => vcard, :publisher => publisher }
        end
      end

    end

    def process_vcard_for_page(name = nil)
      name ||= @page.metadata('title')
      if name
        nn = name.downcase.gsub(/\W+/, '-')
        vcard = "content/attachments/vcf/" + nn + ".vcf"
        process_vcard( vcard );
      else
        haml_tag :h3, :name => name
      end
    end

  end
end

class Vpim::Vcard
  def single_line_address()
    str = ""
    return "" if self.address == nil
    str += self.address.street if self.address.street
    str += ", " + self.address.extended if self.address.extended
    str += ", " + self.address.locality if self.address.locality
    str += ", " + self.address.region if self.address.region
    str += " " + self.address.postalcode if self.address.postalcode
  end

  def complete_name()
    unless self.name.fullname == nil || self.name.fullname == "" 
      return self.name.fullname
    else
      return self.name.given + " " + self.name.family
    end
  end
end
