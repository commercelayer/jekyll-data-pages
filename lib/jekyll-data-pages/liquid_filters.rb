module JekyllDataPages
  module LiquidFilters
    def datapage_url(input, dir)
      extension = Jekyll.configuration({})['page_gen-dirs'] ? '/' : '.html'
      "#{dir}/#{input.to_s.parameterize}#{extension}"
    end
  end
end

Liquid::Template.register_filter(JekyllDataPages::LiquidFilters)
