Vagrant.configure("2") do |config|
  config.vm.define :crystal do |cli|
    cli.vm.synced_folder '.', '/home/ricardog/gdal.cr'
    cli.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = './host/Vagrantfile'
      #d.force_host_vm = true
      d.build_dir = "."
      d.build_args = ['-t', 'gdal.cr:latest']
      d.env = {PASSWORD: 'browsesafely'}
      d.ports = ['8080:8080']
      d.volumes = ["/home/ricardog/src/gdal.cr:/src"]
      d.cmd = %w(crystal play -p 8080 -b 0.0.0.0 -v)
    end
    cli.trigger.before :up, :reload, :resume do |trigger|
      trigger.info = "Syncing source code"
      trigger.run = {path: "./host/rsync.sh",
                     args: [".", "bonobo:#{Dir.pwd}/"]}
    end
    cli.trigger.after :suspend, :halt, :destroy do |trigger|
      trigger.info = "Syncing source code"
      trigger.run = {path: "./host/rsync.sh",
                     args: ["bonobo:#{Dir.pwd}/", "."]}
    end
  end
end
