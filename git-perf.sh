# https://www.git-tower.com/blog/git-performance
git config core.fsmonitor true
git config feature.manyFiles true
git fsmonitor--daemon status
git config core.untrackedcache true

git gc
git config core.commitgraph true
git config fetch.writeCommitGraph true
