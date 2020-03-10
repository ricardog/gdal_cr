Vagrant.configure("2") do |config|
  config.vm.define :crystal do |cli|
    cli.vm.synced_folder '.', '/home/gdal/gdal_cr'
    cli.vm.provider "docker" do |d|
      d.build_dir = "."
      d.build_args = ['-t', 'gdal_cr:latest']
      d.ports = ['8080:8080']
      d.cmd = %w(crystal play -p 8080 -b 0.0.0.0 -v)
    end
    cli.trigger.before :up, :reload, :resume do |trigger|
      trigger.info = "Syncing source code"
      trigger.run = {path: "./host/rsync.sh"}
    end
    cli.trigger.after :suspend, :halt, :destroy do |trigger|
      trigger.info = "Syncing source code"
      trigger.run = {path: "./host/rsync.sh", args: ["--reverse"]}
    end
  end
end
