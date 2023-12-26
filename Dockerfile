# FROM node:15
# WORKDIR /app
# COPY package.json .
# RUN npm install
# COPY . .
# ENV PORT 5001
# EXPOSE $PORT
# CMD ["npm", "run", "start"]



########################################################################
# FROM node:15
# WORKDIR /app
# COPY package.json .

# ARG NODE_ENV
# RUN if [ "$NODE_ENV" = "production" ]; \
#     then npm install --only=production; \
#     else npm install; \
#     fi

# COPY . .
# ENV PORT 5001
# EXPOSE $PORT
# CMD ["npm", "run", "start"]

########################################################################
# FROM node:15 as development

# WORKDIR /app
# COPY package.json .
# RUN npm install 
# COPY . .
# ENV PORT 5001
# EXPOSE $PORT
# CMD ["npm", "run", "start:dev"]

# FROM node:15 as production

# WORKDIR /app
# COPY package.json .
# RUN npm install --only=production
# COPY . .
# ENV PORT 5001
# EXPOSE $PORT
# CMD ["npm", "run", "start"]

########################################################################

FROM node:15 as base

FROM base as development

WORKDIR /app
COPY package.json .
RUN npm install 
COPY . .
ENV PORT 5001
EXPOSE $PORT
CMD ["npm", "run", "start:dev"]

FROM base as production

WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
ENV PORT 5001
EXPOSE $PORT
CMD ["npm", "run", "start"]