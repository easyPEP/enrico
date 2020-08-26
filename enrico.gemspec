# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: enrico 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "enrico"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kalle Saas"]
  s.date = "2020-04-08"
  s.description = "http://github.com/easyPEP/enrico"
  s.email = "kalle@easypep.de"
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
    "enrico.gemspec",
    "lib/enrico.rb",
    "lib/enrico/country.rb",
    "lib/enrico/vacation_day.rb",
    "spec/fixtures/vcr_cassettes/is_public_holiday.yml",
    "spec/fixtures/vcr_cassettes/holidays_in_date_range.yml",
    "spec/fixtures/vcr_cassettes/holidays_in_month.yml",
    "spec/fixtures/vcr_cassettes/holidays_in_year.yml",
    "spec/fixtures/vcr_cassettes/supported_countries.yml",
    "spec/lib/enrico/country_public_holidays_for_month_spec.rb",
    "spec/lib/enrico/country_spec.rb",
    "spec/lib/enrico/is_public_holiday_spec.rb",
    "spec/lib/enrico/vacation_day_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/easyPEP/enrico"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.3"
  s.summary = "A ruby wrapper around enrico holiday API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["= 0.18.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["= 2.3.5"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, ["= 0.18.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["= 1.8.8"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, ["= 0.18.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["= 2.3.5"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
