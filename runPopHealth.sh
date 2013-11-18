mongod &
~/Application/redis-2.6.15/src/redis-server &
QUEUE=* bundle exec rake resque:work
