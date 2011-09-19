JenkinsCron::Jobs.define do

  job "My first job" do |j|
    j.scm   "git@git.example.com:my-first-job.git"
    j.steps [{:shell => "./script/something_useful"}]
  end

  job "Another job" do |j|
    j.scm   "git@git.example.com:my-first-job.git"
    j.steps [{:shell => "./script/something_useful"}]
  end

end
