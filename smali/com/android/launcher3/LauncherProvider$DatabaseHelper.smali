.class public Lcom/android/launcher3/LauncherProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"

# interfaces
.implements Lcom/android/launcher3/AutoInstallsLayout$LayoutParserCallback;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mMaxItemId:J

.field mMaxScreenId:J

.field private final mWidgetHostResetHandler:Landroid/os/Handler;


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    .line 733
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 2

    .line 555
    const-string v0, "launcher.db"

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V

    .line 559
    const-string p1, "favorites"

    invoke-direct {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->tableExists(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "workspaceScreens"

    invoke-direct {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->tableExists(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 560
    :cond_0
    const-string p1, "LauncherProvider"

    const-string p2, "Tables are missing after onCreate has been called. Trying to recreate"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addFavoritesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 563
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addWorkspacesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 566
    :cond_1
    iget-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    const-wide/16 v0, -0x1

    cmp-long p1, p1, v0

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string p2, "favorites"

    invoke-static {p1, p2}, Lcom/android/launcher3/LauncherProvider;->getMaxId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    :cond_2
    iget-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    cmp-long p1, p1, v0

    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string p2, "workspaceScreens"

    invoke-static {p1, p2}, Lcom/android/launcher3/LauncherProvider;->getMaxId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    .line 567
    :cond_3
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 3

    .line 574
    new-instance v0, Lcom/android/launcher3/util/NoLocaleSqliteContext;

    invoke-direct {v0, p1}, Lcom/android/launcher3/util/NoLocaleSqliteContext;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    const/16 v2, 0x1b

    invoke-direct {p0, v0, p3, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 551
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 552
    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    .line 575
    iput-object p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    .line 576
    iput-object p2, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mWidgetHostResetHandler:Landroid/os/Handler;

    .line 577
    return-void
.end method

.method private addFavoritesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 2

    .line 642
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getDefaultUserSerial()J

    move-result-wide v0

    invoke-static {p1, v0, v1, p2}, Lcom/android/launcher3/LauncherSettings$Favorites;->addTableToDb(Landroid/database/sqlite/SQLiteDatabase;JZ)V

    .line 643
    return-void
.end method

.method private addIntegerColumn(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z
    .locals 4

    .line 993
    :try_start_0
    new-instance v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v0, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 994
    const/4 v1, 0x0

    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ALTER TABLE favorites ADD COLUMN "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " INTEGER NOT NULL DEFAULT "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, ";"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 996
    iget-object p1, v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 997
    :try_start_2
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1001
    const/4 p1, 0x1

    return p1

    .line 997
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 993
    :catch_0
    move-exception p1

    move-object v1, p1

    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 997
    :goto_0
    :try_start_4
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_1

    .line 1000
    :catch_1
    move-exception p1

    .line 998
    const-string p2, "LauncherProvider"

    invoke-virtual {p1}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 999
    const/4 p1, 0x0

    return p1
.end method

.method private addWorkspacesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 2

    .line 646
    if-eqz p2, :cond_0

    const-string p2, " IF NOT EXISTS "

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 647
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CREATE TABLE "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "workspaceScreens (_id INTEGER PRIMARY KEY,screenRank INTEGER,modified INTEGER NOT NULL DEFAULT 0);"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 652
    return-void
.end method

.method private tableExists(Ljava/lang/String;)Z
    .locals 13

    .line 591
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "sqlite_master"

    const-string v1, "tbl_name"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "tbl_name = ?"

    const/4 v11, 0x1

    new-array v5, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object p1, v5, v12

    const/4 v1, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v0 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p1

    .line 596
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v0, :cond_0

    .line 598
    move v12, v11

    goto :goto_0

    .line 596
    :cond_0
    nop

    .line 598
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 596
    return v12

    .line 598
    :catchall_0
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0
.end method


# virtual methods
.method public final checkId(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 2

    .line 1028
    const-string v0, "_id"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 1029
    const-string p2, "workspaceScreens"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1030
    iget-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    return-void

    .line 1032
    :cond_0
    iget-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 1034
    return-void
.end method

.method final convertShortcutsToLauncherActivities(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 11

    .line 885
    :try_start_0
    new-instance v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v0, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_4

    .line 887
    const/4 v1, 0x0

    :try_start_1
    const-string v3, "favorites"

    const-string v2, "_id"

    const-string v4, "intent"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v4

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "itemType=1 AND profileId="

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 890
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getDefaultUserSerial()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 887
    move-object v2, p1

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 885
    nop

    .line 892
    :try_start_2
    const-string v3, "UPDATE favorites SET itemType=0 WHERE _id=?"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 885
    nop

    .line 895
    :try_start_3
    const-string v3, "_id"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    .line 896
    const-string v4, "intent"

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    .line 898
    :cond_0
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 899
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 902
    const/4 v6, 0x0

    :try_start_4
    invoke-static {v5, v6}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v5
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 906
    nop

    .line 908
    :try_start_5
    invoke-static {v5}, Lcom/android/launcher3/Utilities;->isLauncherAppTarget(Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 909
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 913
    const/4 v7, 0x1

    invoke-virtual {p1, v7, v5, v6}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 914
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    .line 915
    goto :goto_0

    .line 903
    :catch_0
    move-exception v5

    .line 904
    const-string v6, "LauncherProvider"

    const-string v7, "Unable to parse intent"

    invoke-static {v6, v7, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 905
    goto :goto_0

    .line 916
    :cond_1
    iget-object v3, v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 917
    if-eqz p1, :cond_2

    :try_start_6
    invoke-static {v1, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :cond_2
    if-eqz v2, :cond_3

    :try_start_7
    invoke-static {v1, v2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    :cond_3
    :try_start_8
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_8
    .catch Landroid/database/SQLException; {:try_start_8 .. :try_end_8} :catch_4

    return-void

    :catchall_0
    move-exception v3

    move-object v4, v1

    goto :goto_1

    .line 885
    :catch_1
    move-exception v3

    :try_start_9
    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 917
    :catchall_1
    move-exception v4

    move-object v10, v4

    move-object v4, v3

    move-object v3, v10

    :goto_1
    if-eqz p1, :cond_4

    :try_start_a
    invoke-static {v4, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_4
    throw v3
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p1

    move-object v3, v1

    goto :goto_2

    .line 885
    :catch_2
    move-exception p1

    :try_start_b
    throw p1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 917
    :catchall_3
    move-exception v3

    move-object v10, v3

    move-object v3, p1

    move-object p1, v10

    :goto_2
    if-eqz v2, :cond_5

    :try_start_c
    invoke-static {v3, v2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_5
    throw p1
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_4
    move-exception p1

    goto :goto_3

    .line 885
    :catch_3
    move-exception p1

    move-object v1, p1

    :try_start_d
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 917
    :goto_3
    :try_start_e
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_e
    .catch Landroid/database/SQLException; {:try_start_e .. :try_end_e} :catch_4

    .line 919
    :catch_4
    move-exception p1

    .line 918
    const-string v0, "LauncherProvider"

    const-string v1, "Error deduping shortcuts"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 920
    return-void
.end method

.method public final createEmptyDB(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3

    .line 832
    new-instance v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v0, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 833
    const/4 v1, 0x0

    :try_start_0
    const-string v2, "DROP TABLE IF EXISTS favorites"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 834
    const-string v2, "DROP TABLE IF EXISTS workspaceScreens"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 835
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 836
    iget-object p1, v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 837
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 832
    :catch_0
    move-exception p1

    move-object v1, p1

    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 837
    :goto_0
    invoke-static {v1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
.end method

.method public final generateNewItemId()J
    .locals 4

    .line 1011
    iget-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 1012
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error: max item id was not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1014
    :cond_0
    iget-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 1015
    iget-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    return-wide v0
.end method

.method public final getDefaultUserSerial()J
    .locals 2

    .line 637
    iget-object v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/launcher3/compat/UserManagerCompat;->getInstance(Landroid/content/Context;)Lcom/android/launcher3/compat/UserManagerCompat;

    move-result-object v0

    .line 638
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v1

    .line 637
    invoke-virtual {v0, v1}, Lcom/android/launcher3/compat/UserManagerCompat;->getSerialNumberForUser(Landroid/os/UserHandle;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final insertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 2

    .line 1024
    const-string v0, "favorites"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lcom/android/launcher3/LauncherProvider;->dbInsertAndCheck(Lcom/android/launcher3/LauncherProvider$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    return-wide p1
.end method

.method final loadFavorites(Landroid/database/sqlite/SQLiteDatabase;Lcom/android/launcher3/AutoInstallsLayout;)I
    .locals 7

    .line 1058
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1060
    invoke-virtual {p2, p1, v0}, Lcom/android/launcher3/AutoInstallsLayout;->loadLayout(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/ArrayList;)I

    move-result p2

    .line 1063
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1064
    nop

    .line 1065
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1066
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 1067
    invoke-virtual {v1}, Landroid/content/ContentValues;->clear()V

    .line 1068
    const-string v4, "_id"

    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1069
    const-string v3, "screenRank"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1070
    const-string v3, "workspaceScreens"

    const/4 v4, 0x0

    invoke-static {p0, p1, v3, v4, v1}, Lcom/android/launcher3/LauncherProvider;->dbInsertAndCheck(Lcom/android/launcher3/LauncherProvider$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    .line 1071
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Failed initialize screen tablefrom default layout"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1074
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 1075
    goto :goto_0

    .line 1078
    :cond_1
    const-string v0, "favorites"

    invoke-static {p1, v0}, Lcom/android/launcher3/LauncherProvider;->getMaxId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 1079
    const-string v0, "workspaceScreens"

    invoke-static {p1, v0}, Lcom/android/launcher3/LauncherProvider;->getMaxId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    .line 1081
    return p2
.end method

.method public final newLauncherWidgetHost()Landroid/appwidget/AppWidgetHost;
    .locals 2

    .line 1019
    new-instance v0, Lcom/android/launcher3/LauncherAppWidgetHost;

    iget-object v1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/launcher3/LauncherAppWidgetHost;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8

    .line 606
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 607
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    .line 609
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addFavoritesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 610
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addWorkspacesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 613
    const-string v1, "favorites"

    invoke-static {p1, v1}, Lcom/android/launcher3/LauncherProvider;->getMaxId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxItemId:J

    .line 614
    iget-object p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mWidgetHostResetHandler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->newLauncherWidgetHost()Landroid/appwidget/AppWidgetHost;

    move-result-object p1

    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHost;->deleteHost()V

    iget-object p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mWidgetHostResetHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/launcher3/Utilities;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "EMPTY_DATABASE_CREATED"

    const/4 v2, 0x1

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    iget-object v1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/launcher3/compat/UserManagerCompat;->getInstance(Landroid/content/Context;)Lcom/android/launcher3/compat/UserManagerCompat;

    move-result-object v2

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/UserHandle;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "user_folder_"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lcom/android/launcher3/compat/UserManagerCompat;->getSerialNumberForUser(Landroid/os/UserHandle;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string p1, "com.android.launcher3.managedusers.prefs"

    invoke-virtual {v1, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    :cond_3
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 615
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 4

    .line 819
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v1, "downgrade_schema.json"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/android/launcher3/model/DbDowngradeHelper;->parse(Ljava/io/File;)Lcom/android/launcher3/model/DbDowngradeHelper;

    move-result-object v0

    .line 820
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    add-int/lit8 v2, p2, -0x1

    :goto_0
    if-lt v2, p3, :cond_1

    iget-object v3, v0, Lcom/android/launcher3/model/DbDowngradeHelper;->mStatements:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    if-nez v3, :cond_0

    new-instance v0, Landroid/database/sqlite/SQLiteException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Downgrade path not supported to version "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {v1, v3}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v0, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object v1, v0, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v2, v0}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    move-object v2, v1

    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_2
    :try_start_4
    invoke-static {v2, v0}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 825
    :catch_1
    move-exception v0

    .line 822
    const-string v1, "LauncherProvider"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to downgrade from: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " to "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ". Wiping databse."

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 824
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->createEmptyDB(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 826
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8

    .line 687
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 689
    iget-object v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v1, "downgrade_schema.json"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 690
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 691
    iget-object v1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/launcher3/compat/UserManagerCompat;->getInstance(Landroid/content/Context;)Lcom/android/launcher3/compat/UserManagerCompat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/compat/UserManagerCompat;->getUserProfiles()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/UserHandle;

    invoke-virtual {v1, v3}, Lcom/android/launcher3/compat/UserManagerCompat;->getSerialNumberForUser(Landroid/os/UserHandle;)J

    move-result-wide v3

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "update favorites set intent = replace(intent, \';l.profile="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ";\', \';\') where itemType = 0;"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 693
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    :try_start_0
    invoke-static {v0}, Lcom/android/launcher3/model/DbDowngradeHelper;->parse(Ljava/io/File;)Lcom/android/launcher3/model/DbDowngradeHelper;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/model/DbDowngradeHelper;->version:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v2, 0x1b

    if-lt v1, v2, :cond_1

    return-void

    :catch_0
    move-exception v1

    :cond_1
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v2, 0x7f090000

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-static {p1, v1}, Lcom/android/launcher3/util/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p1, :cond_2

    :try_start_4
    invoke-static {v0, p1}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_2
    :try_start_5
    invoke-static {v0, v1}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    return-void

    :catchall_0
    move-exception v2

    move-object v3, v0

    goto :goto_1

    :catch_1
    move-exception v2

    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    :goto_1
    if-eqz p1, :cond_3

    :try_start_7
    invoke-static {v3, p1}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_3
    throw v2
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception p1

    goto :goto_2

    :catch_2
    move-exception p1

    move-object v0, p1

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :goto_2
    :try_start_9
    invoke-static {v0, v1}, Lcom/android/launcher3/model/DbDowngradeHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    :catch_3
    move-exception p1

    const-string v0, "DbDowngradeHelper"

    const-string v1, "Error writing schema file"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 695
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 8

    .line 718
    const/4 p3, 0x0

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_3

    .line 724
    :pswitch_0
    iput-wide v0, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J

    .line 725
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addWorkspacesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 728
    :pswitch_1
    :try_start_0
    new-instance p2, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {p2, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_3

    .line 730
    :try_start_1
    const-string v3, "ALTER TABLE favorites ADD COLUMN appWidgetProvider TEXT;"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 732
    iget-object v3, p2, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 733
    :try_start_2
    invoke-static {v2, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_3

    .line 740
    :pswitch_2
    :try_start_3
    new-instance p2, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {p2, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_3
    .catch Landroid/database/SQLException; {:try_start_3 .. :try_end_3} :catch_1

    .line 742
    :try_start_4
    const-string v3, "ALTER TABLE favorites ADD COLUMN modified INTEGER NOT NULL DEFAULT 0;"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 744
    const-string v3, "ALTER TABLE workspaceScreens ADD COLUMN modified INTEGER NOT NULL DEFAULT 0;"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 746
    iget-object v3, p2, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 747
    :try_start_5
    invoke-static {v2, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_5
    .catch Landroid/database/SQLException; {:try_start_5 .. :try_end_5} :catch_1

    .line 754
    :pswitch_3
    const-string p2, "restored"

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addIntegerColumn(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 756
    :pswitch_4
    const-string p2, "DELETE FROM favorites WHERE screen NOT IN (SELECT _id FROM workspaceScreens) AND container = -100"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "DELETE FROM favorites WHERE container <> -100 AND container <> -101 AND container NOT IN (SELECT _id FROM favorites WHERE itemType = 2)"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 774
    :pswitch_5
    const-string p2, "profileId"

    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->getDefaultUserSerial()J

    move-result-wide v3

    invoke-direct {p0, p1, p2, v3, v4}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addIntegerColumn(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 776
    :pswitch_6
    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->updateFolderItemsRank(Landroid/database/sqlite/SQLiteDatabase;Z)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 781
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->recreateWorkspaceTable(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 786
    :pswitch_8
    const-string p2, "options"

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addIntegerColumn(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 791
    :pswitch_9
    iget-object p2, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/android/launcher3/compat/UserManagerCompat;->getInstance(Landroid/content/Context;)Lcom/android/launcher3/compat/UserManagerCompat;

    move-result-object v0

    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v1

    invoke-virtual {v0}, Lcom/android/launcher3/compat/UserManagerCompat;->getUserProfiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/UserHandle;

    invoke-virtual {v1, v4}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    if-nez v2, :cond_1

    const-string v2, "com.android.launcher3.managedusers.prefs"

    invoke-virtual {p2, v2, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "user_folder_"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/android/launcher3/compat/UserManagerCompat;->getSerialNumberForUser(Landroid/os/UserHandle;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-wide/16 v6, -0x1

    invoke-interface {v5, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 799
    :cond_2
    :pswitch_a
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->convertShortcutsToLauncherActivities(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 802
    :pswitch_b
    iget-object p2, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    .line 803
    invoke-static {p2, p1}, Lcom/android/launcher3/provider/LauncherDbUtils;->prepareScreenZeroToHostQsb(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 804
    :pswitch_c
    return-void

    .line 747
    :catchall_0
    move-exception p3

    goto :goto_1

    .line 740
    :catch_0
    move-exception p3

    move-object v2, p3

    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 747
    :goto_1
    :try_start_7
    invoke-static {v2, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p3
    :try_end_7
    .catch Landroid/database/SQLException; {:try_start_7 .. :try_end_7} :catch_1

    .line 751
    :catch_1
    move-exception p2

    .line 748
    const-string p3, "LauncherProvider"

    invoke-virtual {p2}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 750
    goto :goto_3

    .line 733
    :catchall_1
    move-exception p3

    goto :goto_2

    .line 728
    :catch_2
    move-exception p3

    move-object v2, p3

    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 733
    :goto_2
    :try_start_9
    invoke-static {v2, p2}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p3
    :try_end_9
    .catch Landroid/database/SQLException; {:try_start_9 .. :try_end_9} :catch_3

    .line 737
    :catch_3
    move-exception p2

    .line 734
    const-string p3, "LauncherProvider"

    invoke-virtual {p2}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 736
    nop

    .line 812
    :cond_3
    :goto_3
    const-string p2, "LauncherProvider"

    const-string p3, "Destroying all old data."

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 813
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->createEmptyDB(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 814
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method public final recreateWorkspaceTable(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 12

    .line 926
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v1, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_2

    .line 929
    const/4 v2, 0x0

    :try_start_1
    const-string v4, "workspaceScreens"

    const-string v3, "_id"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "screenRank"

    move-object v3, p1

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 934
    :try_start_2
    new-instance v4, Ljava/util/ArrayList;

    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 935
    invoke-static {v3, v0, v5}, Lcom/android/launcher3/provider/LauncherDbUtils;->iterateCursor(Landroid/database/Cursor;ILjava/util/Collection;)Ljava/util/Collection;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 936
    if-eqz v3, :cond_0

    :try_start_3
    invoke-static {v2, v3}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    .line 937
    :cond_0
    const-string v3, "DROP TABLE IF EXISTS workspaceScreens"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 938
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->addWorkspacesTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 941
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 942
    move v5, v0

    :goto_0
    if-ge v5, v3, :cond_1

    .line 943
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 944
    const-string v7, "_id"

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 945
    const-string v7, "screenRank"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 946
    invoke-static {v6}, Lcom/android/launcher3/LauncherProvider;->addModifiedTime(Landroid/content/ContentValues;)V

    .line 947
    const-string v7, "workspaceScreens"

    invoke-virtual {p1, v7, v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 942
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 949
    :cond_1
    iget-object p1, v1, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 950
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    const-wide/16 v3, 0x0

    goto :goto_1

    :cond_2
    invoke-static {v4}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    :goto_1
    iput-wide v3, p0, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->mMaxScreenId:J
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 951
    :try_start_4
    invoke-static {v2, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_2

    .line 956
    const/4 p1, 0x1

    return p1

    .line 936
    :catchall_0
    move-exception p1

    move-object v4, v2

    goto :goto_2

    .line 929
    :catch_0
    move-exception p1

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 936
    :catchall_1
    move-exception v4

    move-object v11, v4

    move-object v4, p1

    move-object p1, v11

    :goto_2
    if-eqz v3, :cond_3

    :try_start_6
    invoke-static {v4, v3}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_3
    throw p1
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 951
    :catchall_2
    move-exception p1

    goto :goto_3

    .line 926
    :catch_1
    move-exception p1

    move-object v2, p1

    :try_start_7
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 951
    :goto_3
    :try_start_8
    invoke-static {v2, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_8
    .catch Landroid/database/SQLException; {:try_start_8 .. :try_end_8} :catch_2

    .line 955
    :catch_2
    move-exception p1

    .line 953
    const-string v1, "LauncherProvider"

    invoke-virtual {p1}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 954
    return v0
.end method

.method public final removeGhostWidgets(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 11

    .line 847
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->newLauncherWidgetHost()Landroid/appwidget/AppWidgetHost;

    move-result-object v0

    .line 852
    :try_start_0
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->getAppWidgetIds()[I

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IncompatibleClassChangeError; {:try_start_0 .. :try_end_0} :catch_3

    .line 856
    nop

    .line 857
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 858
    :try_start_1
    const-string v4, "favorites"

    const-string v3, "appWidgetId"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "itemType=4"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, p1

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_2

    .line 861
    :goto_0
    const/4 v3, 0x0

    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 862
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 864
    :cond_0
    if-eqz p1, :cond_1

    :try_start_3
    invoke-static {v3, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_3
    .catch Landroid/database/SQLException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 867
    :cond_1
    nop

    .line 868
    :goto_1
    array-length p1, v1

    :goto_2
    if-ge v5, p1, :cond_3

    aget v3, v1, v5

    .line 869
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 871
    :try_start_4
    const-string v4, "LauncherProvider"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Deleting invalid widget "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/android/launcher3/logging/FileLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 872
    invoke-virtual {v0, v3}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetId(I)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 875
    goto :goto_3

    .line 873
    :catch_0
    move-exception v3

    .line 868
    :cond_2
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 878
    :cond_3
    return-void

    .line 864
    :catchall_0
    move-exception v0

    goto :goto_4

    .line 858
    :catch_1
    move-exception v0

    move-object v3, v0

    :try_start_5
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 864
    :goto_4
    if-eqz p1, :cond_4

    :try_start_6
    invoke-static {v3, p1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    :cond_4
    throw v0
    :try_end_6
    .catch Landroid/database/SQLException; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception p1

    .line 865
    const-string v0, "LauncherProvider"

    const-string v1, "Error getting widgets list"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 866
    return-void

    .line 853
    :catch_3
    move-exception p1

    .line 854
    const-string v0, "LauncherProvider"

    const-string v1, "getAppWidgetIds not supported"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 855
    return-void
.end method

.method final updateFolderItemsRank(Landroid/database/sqlite/SQLiteDatabase;Z)Z
    .locals 11

    .line 960
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;

    invoke-direct {v1, p1}, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 961
    const/4 v2, 0x0

    if-eqz p2, :cond_0

    .line 963
    :try_start_1
    const-string p2, "ALTER TABLE favorites ADD COLUMN rank INTEGER NOT NULL DEFAULT 0;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 980
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 960
    :catch_0
    move-exception p1

    move-object v2, p1

    goto :goto_2

    .line 967
    :cond_0
    :goto_0
    const-string p2, "SELECT container, MAX(cellX) FROM favorites WHERE container IN (SELECT _id FROM favorites WHERE itemType = ?) GROUP BY container;"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    .line 970
    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v0

    .line 967
    invoke-virtual {p1, p2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2

    .line 972
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 973
    const-string v4, "UPDATE favorites SET rank=cellX+(cellY*?) WHERE container=? AND cellX IS NOT NULL AND cellY IS NOT NULL;"

    new-array v6, v5, [Ljava/lang/Object;

    .line 975
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v3

    .line 973
    invoke-virtual {p1, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 978
    :cond_1
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 979
    iget-object p1, v1, Lcom/android/launcher3/provider/LauncherDbUtils$SQLiteTransaction;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 980
    :try_start_2
    invoke-static {v2, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 985
    return v3

    .line 960
    :goto_2
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 980
    :goto_3
    :try_start_4
    invoke-static {v2, v1}, Lcom/android/launcher3/LauncherProvider$DatabaseHelper;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw p1
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_1

    .line 984
    :catch_1
    move-exception p1

    .line 982
    const-string p2, "LauncherProvider"

    invoke-virtual {p1}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 983
    return v0
.end method
