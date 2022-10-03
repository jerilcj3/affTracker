-- CreateTable
CREATE TABLE "Campaign" (
    "id" TEXT NOT NULL,
    "campID" TEXT NOT NULL,
    "campaign_name" TEXT NOT NULL,
    "ad_angle" TEXT NOT NULL,
    "traffic_source" TEXT NOT NULL,
    "created_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "campaign_url" TEXT NOT NULL,
    "impressions" INTEGER DEFAULT 0,
    "unique_sessions" INTEGER DEFAULT 0,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sid" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Metrics" (
    "id" TEXT NOT NULL,
    "sessionID" TEXT NOT NULL,
    "fingerprint" TEXT NOT NULL,
    "token" JSONB NOT NULL,
    "created_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "campID" TEXT NOT NULL,

    CONSTRAINT "Metrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Paths" (
    "id" TEXT NOT NULL,
    "paths" JSONB NOT NULL,

    CONSTRAINT "Paths_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Routes" (
    "id" TEXT NOT NULL,
    "pageID" TEXT NOT NULL,
    "campID" TEXT NOT NULL,
    "sessionID" TEXT NOT NULL,

    CONSTRAINT "Routes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Campaign_campID_key" ON "Campaign"("campID");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sid_key" ON "Session"("sid");

-- AddForeignKey
ALTER TABLE "Metrics" ADD CONSTRAINT "Metrics_campID_fkey" FOREIGN KEY ("campID") REFERENCES "Campaign"("campID") ON DELETE RESTRICT ON UPDATE CASCADE;
