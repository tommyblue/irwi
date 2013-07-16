class IrwiWikiViewsGenerator < Rails::Generators::Base

  source_root File.expand_path("../../../../app/views/base_wiki_pages", __FILE__)

  desc "Creates Irwi wiki views in app/views/base_wiki_pages/ to customize them"

  def views
    empty_directory 'app/views/base_wiki_pages'

    Dir.foreach File.expand_path("../../../../app/views/base_wiki_pages", __FILE__) do |file| # Searching for files in app/views
      copy_file( file, 'app/views/base_wiki_pages/' + file ) if file != '.' && file != '..'
    end
  end

end
