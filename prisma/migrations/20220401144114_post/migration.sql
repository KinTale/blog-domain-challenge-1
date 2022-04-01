-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "userProfile" INTEGER NOT NULL,
    "title" VARCHAR(150) NOT NULL,
    "content" TEXT NOT NULL,
    "post" BOOLEAN NOT NULL DEFAULT false,
    "pictureUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Post_userProfile_key" ON "Post"("userProfile");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userProfile_fkey" FOREIGN KEY ("userProfile") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
