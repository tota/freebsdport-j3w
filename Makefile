# New ports collection makefile for:	j3w
# Date created:		2011-03-24
# Whom:			TAKATSU Tomonari <tota@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	j3w
PORTVERSION=	6.50
CATEGORIES=	devel
MASTER_SITES=	http://www.mztn.org/
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//}

MAINTAINER=	tota@FreeBSD.org
COMMENT=	Hoge

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.//}

USE_GMAKE=	yes

.include <bsd.port.pre.mk>

do-patch:
	${REINPLACE_CMD} -i '' -e 's/OS = LINUX/OS = FREEBSD/' ${WRKSRC}/Makefile
.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
	${REINPLACE_CMD} -i '' -e 's/BIT64 = 0/BIT64 = 1/' ${WRKSRC}/Makefile
.endif

.include <bsd.port.post.mk>
