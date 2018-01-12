all: README.md index

ComputationalEnvironments.ctv: compenv.md buildxml.R
	pandoc -w html --wrap=none -o ComputationalEnvironments.ctv compenv.md
	R -e 'source("buildxml.R")'

ComputationalEnvironments.html: ComputationalEnvironments.ctv
	R -e 'if(!require("ctv")) install.packages("ctv", repos = "http://cran.rstudio.com/"); ctv::ctv2html("ComputationalEnvironments.ctv")'

README.md: ComputationalEnvironments.html
	pandoc -w gfm --wrap=none -o README.md ComputationalEnvironments.html
	sed -i.tmp -e 's|( \[|(\[|g' README.md
	sed -i.tmp -e 's| : |: |g' README.md
	sed -i.tmp -e 's|../packages/|http://cran.r-project.org/web/packages/|g' README.md
	# sed -i.tmp -e '4s/.*/| | |\n|---|---|/' README.md
	bash -c "echo -e '*Do not edit this README by hand. See [CONTRIBUTING.md](CONTRIBUTING.md).*\n' > README.tmp"
	bash -c "cat README.md >> README.tmp"
	mv README.tmp README.md
	sed -i '/view=ComputationalEnvironments/d' README.md
	rm *.tmp

check:
	R -e 'if(!require("ctv")) install.packages("ctv", repos = "http://cran.rstudio.com/"); print(ctv::check_ctv_packages("ComputationalEnvironments.ctv", repos = "http://cran.rstudio.com/"))'

checkurls:
	R -e 'source("checkurls.R")'

README.html: README.md
	pandoc --from=gfm -o README.html README.md

clean:
	rm README.md
	rm ComputationalEnvironments.*
	rm *.html

index:
	cp ComputationalEnvironments.html index.html
	# remove lines linking to the official cran page
	sed -i '/view=ComputationalEnvironments/d' index.html
	# fix the CSS URL
	sed -i 's|../CRAN_web.css|https://cran.r-project.org/R.css|g' index.html
	# fix link list
	sed -i 's|../packages|https://cran.r-project.org/web/packages|g' index.html

#diff:
#	git pull
#	svn checkout svn://svn.r-forge.r-project.org/svnroot/ctv/pkg/inst/ctv
#	cp ./ctv/ComputationalEnvironments.ctv ComputationalEnvironments.ctv
#	git diff ComputationalEnvironments.ctv > cran.diff
#	git checkout -- ComputationalEnvironments.ctv
#	rm -r ./ctv
#
#svn:
#	svn checkout svn+ssh://schamber789@svn.r-forge.r-project.org/svnroot/ctv/
#	cp ComputationalEnvironments.ctv ./ctv/pkg/inst/ctv/
#	cd ./ctv
#	svn status
#
#release:
#	cd ./ctv
#	svn commit --message "update ComputationalEnvironments"
#	cd ../
#	rm -r ./ctv
#