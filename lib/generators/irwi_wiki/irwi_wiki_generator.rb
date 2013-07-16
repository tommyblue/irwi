class IrwiWikiGenerator < Rails::Generators::Base

  include Rails::Generators::Migration

  source_root File.expand_path("../templates", __FILE__)

  desc "Creates controllers, helpers, models and migrations needed to use Irwi wiki"

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def generate_wiki

    # Controllers
    copy_file 'controllers/wiki_pages_controller.rb', 'app/controllers/wiki_pages_controller.rb'

    # Helpers
    copy_file 'helpers/wiki_pages_helper.rb', 'app/helpers/wiki_pages_helper.rb'

    # Models
    copy_file 'models/wiki_page.rb',         'app/models/wiki_page.rb'
    copy_file 'models/wiki_page_version.rb', 'app/models/wiki_page_version.rb'

    # I18n
    copy_file 'locales/en.yml', 'config/locales/irwi.en.yml'

    # Migrations
    migration_template 'migrate/create_wiki_pages.rb', 'db/migrate/create_wiki_pages'

    # Routes
    route "wiki_root '/wiki'"
  end

end
