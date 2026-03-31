class PagesController < ApplicationController
  def about
    @page = Page.find_or_create_by(slug: 'about') do |p|
      p.title = 'About Us'
      p.content = 'Book Nook WPG is a small independent bookstore in Winnipeg that has been open since 2011. We sell new and used books — fiction, non-fiction, kids books, and graphic novels, with a focus on Canadian authors. We have about 8 employees and we love books!'
    end
  end

  def contact
    @page = Page.find_or_create_by(slug: 'contact') do |p|
      p.title = 'Contact Us'
      p.content = 'We would love to hear from you! Visit us at 123 Main Street, Winnipeg, MB. You can reach us by phone at (204) 555-1234 or by email at hello@booknookwpg.ca. Store hours: Monday to Saturday 10am to 6pm, Sunday 12pm to 5pm.'
    end
  end
end
