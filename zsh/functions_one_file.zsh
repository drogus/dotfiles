function new-scratch {
  cur_dir="$HOME/scratch"
  new_dir="$HOME/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "New scratch dir ready for grinding ;>"
}

function fetch-structure {
  curl "http://travis-migrations-structure-dumps.s3.amazonaws.com/structure-$1.sql" > db/main/structure.sql
}
