require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "JenkinsCron" do

  before(:each) do
    JenkinsCron.reset_jobs!
  end

  it 'should reset all loaded configurations' do
    load File.join(File.dirname(__FILE__), "fixtures", "single_jobs_config.rb")

    JenkinsCron::Jobs.size.should == 2
    JenkinsCron::Jobs.reset_jobs!
    JenkinsCron::Jobs.size.should == 0
  end

  it 'should parse the job configuration and create each job on Jenkins' do
    load File.join(File.dirname(__FILE__), "fixtures", "single_jobs_config.rb")

    JenkinsCron::Jobs.size.should == 2
    JenkinsCron::Jobs["My first job"].to_xml.should == <<-XML
<?xml version='1.0' encoding='UTF-8'?>
<project>
  <actions/>
  <description>
    -- THIS IS AUTO-GENERATED FILE BY JenkinsCron! DO NOT ALTER HERE --

    This is a simple test job which doesn't do anything.
  </description>
  <logRotator>
    <daysToKeep>-1</daysToKeep>
    <numToKeep>10</numToKeep>
    <artifactDaysToKeep>-1</artifactDaysToKeep>
    <artifactNumToKeep>-1</artifactNumToKeep>
  </logRotator>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.plugins.git.GitSCM">
    <configVersion>2</configVersion>
    <userRemoteConfigs>
      <hudson.plugins.git.UserRemoteConfig>
        <name>origin</name>
        <refspec>+refs/heads/*:refs/remotes/origin/*</refspec>
        <url>git@git.example.com:my-first-job.git</url>
      </hudson.plugins.git.UserRemoteConfig>
    </userRemoteConfigs>
    <branches>
      <hudson.plugins.git.BranchSpec>
        <name>master</name>
      </hudson.plugins.git.BranchSpec>
    </branches>
    <recursiveSubmodules>false</recursiveSubmodules>
    <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
    <authorOrCommitter>false</authorOrCommitter>
    <clean>false</clean>
    <wipeOutWorkspace>false</wipeOutWorkspace>
    <pruneBranches>false</pruneBranches>
    <remotePoll>false</remotePoll>
    <buildChooser class="hudson.plugins.git.util.DefaultBuildChooser"/>
    <gitTool>Default</gitTool>
    <submoduleCfg class="list"/>
    <relativeTargetDir></relativeTargetDir>
    <excludedRegions></excludedRegions>
    <excludedUsers></excludedUsers>
    <gitConfigName></gitConfigName>
    <gitConfigEmail></gitConfigEmail>
    <skipTag>false</skipTag>
    <scmName></scmName>
  </scm>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers class="vector"/>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <hudson.tasks.Shell>
      <command>./script/something_useful</command>
    </hudson.tasks.Shell>
  </builders>
  <publishers>
    <hudson.plugins.chucknorris.CordellWalkerRecorder>
      <factGenerator/>
    </hudson.plugins.chucknorris.CordellWalkerRecorder>
  </publishers>
  <buildWrappers/>
</project>
    XML
  end

end
