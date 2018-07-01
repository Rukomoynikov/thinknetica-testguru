class GithubClient
  attr_accessor :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist params
  end
end
