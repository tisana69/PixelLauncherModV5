.class Landroid/support/a/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Q:Ljava/lang/ThreadLocal;


# instance fields
.field final R:Landroid/support/v4/c/u;

.field final S:Ljava/util/ArrayList;

.field private final T:Landroid/support/a/b;

.field private U:Landroid/support/a/d;

.field private V:J

.field W:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/support/a/a;->Q:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Landroid/support/v4/c/u;

    invoke-direct {v0}, Landroid/support/v4/c/u;-><init>()V

    iput-object v0, p0, Landroid/support/a/a;->R:Landroid/support/v4/c/u;

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    .line 77
    new-instance v0, Landroid/support/a/b;

    invoke-direct {v0, p0}, Landroid/support/a/b;-><init>(Landroid/support/a/a;)V

    iput-object v0, p0, Landroid/support/a/a;->T:Landroid/support/a/b;

    .line 81
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/support/a/a;->V:J

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/a/a;->W:Z

    .line 249
    return-void
.end method

.method static synthetic a(Landroid/support/a/a;)J
    .locals 2

    .line 39
    iget-wide v0, p0, Landroid/support/a/a;->V:J

    return-wide v0
.end method

.method static synthetic a(Landroid/support/a/a;J)J
    .locals 0

    .line 39
    iput-wide p1, p0, Landroid/support/a/a;->V:J

    return-wide p1
.end method

.method static synthetic b(Landroid/support/a/a;)Ljava/util/ArrayList;
    .locals 0

    .line 39
    iget-object p0, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic b(Landroid/support/a/a;J)V
    .locals 8

    .line 39
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    iget-object v4, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v3, v4, :cond_3

    iget-object v4, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/a/c;

    if-eqz v4, :cond_2

    iget-object v6, p0, Landroid/support/a/a;->R:Landroid/support/v4/c/u;

    invoke-virtual {v6, v4}, Landroid/support/v4/c/u;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    if-nez v6, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v6, v6, v0

    if-gez v6, :cond_1

    iget-object v6, p0, Landroid/support/a/a;->R:Landroid/support/v4/c/u;

    invoke-virtual {v6, v4}, Landroid/support/v4/c/u;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    if-eqz v5, :cond_2

    invoke-interface {v4, p1, p2}, Landroid/support/a/c;->a(J)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    iget-boolean p1, p0, Landroid/support/a/a;->W:Z

    if-eqz p1, :cond_6

    iget-object p1, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v5

    :goto_2
    if-ltz p1, :cond_5

    iget-object p2, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_4

    iget-object p2, p0, Landroid/support/a/a;->S:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_4
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    :cond_5
    iput-boolean v2, p0, Landroid/support/a/a;->W:Z

    :cond_6
    return-void
.end method

.method static synthetic c(Landroid/support/a/a;)Landroid/support/a/d;
    .locals 0

    .line 39
    invoke-virtual {p0}, Landroid/support/a/a;->g()Landroid/support/a/d;

    move-result-object p0

    return-object p0
.end method

.method public static f()Landroid/support/a/a;
    .locals 2

    .line 85
    sget-object v0, Landroid/support/a/a;->Q:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 86
    sget-object v0, Landroid/support/a/a;->Q:Ljava/lang/ThreadLocal;

    new-instance v1, Landroid/support/a/a;

    invoke-direct {v1}, Landroid/support/a/a;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 88
    :cond_0
    sget-object v0, Landroid/support/a/a;->Q:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/a/a;

    return-object v0
.end method


# virtual methods
.method final g()Landroid/support/a/d;
    .locals 2

    .line 107
    iget-object v0, p0, Landroid/support/a/a;->U:Landroid/support/a/d;

    if-nez v0, :cond_1

    .line 108
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 109
    new-instance v0, Landroid/support/a/g;

    iget-object v1, p0, Landroid/support/a/a;->T:Landroid/support/a/b;

    invoke-direct {v0, v1}, Landroid/support/a/g;-><init>(Landroid/support/a/b;)V

    iput-object v0, p0, Landroid/support/a/a;->U:Landroid/support/a/d;

    goto :goto_0

    .line 111
    :cond_0
    new-instance v0, Landroid/support/a/e;

    iget-object v1, p0, Landroid/support/a/a;->T:Landroid/support/a/b;

    invoke-direct {v0, v1}, Landroid/support/a/e;-><init>(Landroid/support/a/b;)V

    iput-object v0, p0, Landroid/support/a/a;->U:Landroid/support/a/d;

    .line 114
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/support/a/a;->U:Landroid/support/a/d;

    return-object v0
.end method
