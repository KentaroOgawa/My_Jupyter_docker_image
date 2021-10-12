# User/Group/Passwd (temp)
USER_NAME=arda
USER_PASSWORD=test
USER_GROUP=developer
TARGET:=R_package_install.R Dockerfile

all: $(TARGET)

R_package_install.R:
	sed -e 's/USER_NAME/$(USER_NAME)/' R_package_install_orig.R > R_package_install.R

Dockerfile:
	cat Dockerfile_orig | \
		sed -e 's/USER_NAME/$(USER_NAME)/g' | \
		sed -e 's/USER_GROUP/$(USER_GROUP)/g' | \
		sed -e 's/USER_PASSWORD/$(USER_PASSWORD)/g' > Dockerfile


clean:
	$(RM) R_package_install.R
	$(RM) Dockerfile
