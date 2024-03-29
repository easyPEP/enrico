# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: enrico 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "enrico".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kalle Saas".freeze]
  s.date = "2021-11-12"
  s.description = "http://github.com/easyPEP/enrico".freeze
  s.email = "kalle@easypep.de".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/enrico.rb",
    "lib/enrico/country.rb",
    "lib/enrico/vacation_day.rb",
    "spec/fixtures/vcr_cassettes/holidays_in_date_range.yml",
    "spec/fixtures/vcr_cassettes/holidays_in_month.yml",
    "spec/fixtures/vcr_cassettes/holidays_in_year.yml",
    "spec/fixtures/vcr_cassettes/is_public_holiday.yml",
    "spec/fixtures/vcr_cassettes/supported_countries.yml",
    "spec/lib/enrico/country_public_holidays_for_month_spec.rb",
    "spec/lib/enrico/country_spec.rb",
    "spec/lib/enrico/is_public_holiday_spec.rb",
    "spec/lib/enrico/vacation_day_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/easyPEP/enrico".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "A ruby wrapper around enrico holiday API".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>.freeze, ["= 0.18.1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<httparty>.freeze, ["= 0.18.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>.freeze, ["= 0.18.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end

