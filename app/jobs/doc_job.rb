class DocJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    sleep 10
    name = Time.now.to_i
    f = File.new(Rails.root.join("public", "docs", name.to_s  + ".html"), "w")
    f.write(name)
    f.close
  end
end
