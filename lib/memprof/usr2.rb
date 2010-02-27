require File.expand_path('../../ext/memprof')
Memprof.start
trap('USR2'){
  pid = Process.pid
  fork{
    Memprof.dump_all("/tmp/memprof-#{pid}-#{Time.now.to_i}.json")
    exit!
  }
}
