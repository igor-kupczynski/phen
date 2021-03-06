package pl.poznan.igr.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import pl.poznan.igr.AbstractIntegrationTest;
import pl.poznan.igr.domain.BlobFile;
import pl.poznan.igr.domain.Context;
import pl.poznan.igr.domain.ImportSession;
import pl.poznan.igr.domain.type.Status;
import pl.poznan.igr.service.impor.ImportService;

public class ImportServiceIntegrationTest extends AbstractIntegrationTest {

	public static final String OWNER = "owner";
	public static final String FILE_PATH = "src/test/resources/test.txt";
	public static final String ZIP_PATH = "src/test/resources/testzip.zip";

	@Autowired
	private ImportService importService;

	@Before
	public void setUp() {
		cleanUpDatabase();
	}

	@Test
	public void testImportFile() {

		assertEquals(0, BlobFile.countBlobFiles());
		assertEquals(0, Context.countContexts());

		importService.importFile(OWNER, FILE_PATH);

		assertEquals(1, BlobFile.countBlobFiles());
		assertEquals(1, Context.countContexts());

		BlobFile blobFile = BlobFile.findAllBlobFiles().iterator().next();
		assertEquals("This is a test.", new String(blobFile.getContent()));
		assertEquals("test.txt", new String(blobFile.getFileName()));
		assertFalse(blobFile.getCreated().after(new Date()));

		Context ctx = Context.findAllContexts().get(0);
		assertEquals(OWNER, ctx.getUsername());
		assertFalse(ctx.getStarted().after(new Date()));
		assertNull(ctx.getFinished());
		assertEquals(Status.UPLOADED, ctx.getStatus());

		ImportSession session = ImportSession.findAllImportSessions()
				.iterator().next();
		assertFalse(session.getCreationDate().after(new Date()));
		assertEquals(ctx, session.getContext());

		BlobFile uploadedFile = session.getBlobFile();
		assertEquals(uploadedFile, blobFile);

		ImportSession is = ImportSession.findImportSessionForContext(ctx);
		assertEquals(session, is);
	}

	@Test
	public void testImportZip() {

		assertEquals(0, BlobFile.countBlobFiles());
		assertEquals(0, Context.countContexts());

		importService.importFile(OWNER, ZIP_PATH);

		assertEquals(1, BlobFile.countBlobFiles());
		assertEquals(1, Context.countContexts());

		BlobFile blobFile = BlobFile.findAllBlobFiles().iterator().next();
		assertEquals("testzip.zip", new String(blobFile.getFileName()));
		assertFalse(blobFile.getCreated().after(new Date()));
		Context ctx = Context.findAllContexts().get(0);
		assertEquals(OWNER, ctx.getUsername());
		assertFalse(ctx.getStarted().after(new Date()));
		assertNull(ctx.getFinished());
		assertEquals(Status.UPLOADED, ctx.getStatus());

		ImportSession session = ImportSession.findAllImportSessions()
				.iterator().next();
		assertFalse(session.getCreationDate().after(new Date()));
		assertEquals(ctx, session.getContext());

		BlobFile uploadedFile = session.getBlobFile();
		assertEquals(uploadedFile, blobFile);

		ImportSession is = ImportSession.findImportSessionForContext(ctx);

		assertNotNull(is);
		assertEquals(session, is);
	}

}
